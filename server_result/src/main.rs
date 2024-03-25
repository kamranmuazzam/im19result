use regex::Regex;
use reqwest;
use reqwest::Client;
use std::fs::File;
use std::io::{Result, Write};
use std::sync::{Arc, Mutex};
use tokio::runtime::Runtime;

fn main() {
    let _ = tain().unwrap_or(());
    // tain().unwrap_or_else(|err| {
    //     // Optionally handle or log the error here
    //     println!("Ignoring error");
    // });
}
#[tokio::main]
async fn tain() -> Result<()> {
    let rt = Runtime::new()?;
    let file = Arc::new(Mutex::new(File::create("output.txt")?));
    let mut handles = Vec::new();

    for i in 1..=120 {
        let file_clone = Arc::clone(&file);
        let handle = rt.spawn(async move {
            let result = pp(i).await;
            println!("{}", result);
            let mut file = file_clone.lock().expect("Failed to lock file");
            writeln!(file, "{} {}", i, result).expect("Failed to write to file");
        });
        handles.push(handle);
    }

    // Wait for all tasks to complete
    for handle in handles {
        handle.await?;
    }

    // Explicitly drop the runtime
    // drop(rt);
    // sleep
    std::thread::sleep(std::time::Duration::from_secs(1));

    Ok(())
}

async fn pp(rr: i16) -> String {
    let a = fetch_result(rr, "726".to_string()).await;
    let b = parse_html_to_text_regex(&a);
    let c = result_status(&b);
    println!("{} {}", rr, c);
    return c;
}

async fn fetch_result(roll_number: i16, exam_id: String) -> String {
    println!("fetching result of {}", roll_number);
    let client = Client::new();

    let params = [
        ("reg_no", (9775 + roll_number).to_string()),
        ("pro_id", "1".to_string()),
        ("sess_id", "20".to_string()),
        ("exam_id", exam_id),
        ("gdata", "99".to_string()),
    ];

    let response = client
        .post("https://ducmc.com/ajax/get_program_by_exam.php")
        .form(&params)
        .send()
        .await;

    match response {
        Ok(response) => {
            let result_text = response.text().await.unwrap_or_else(|_| {
                println!("Failed to get response text for {}", roll_number);
                String::new()
            });
            println!(".... {} ..fetched..", roll_number);
            result_text
        }
        Err(_) => {
            println!("Failed to fetch result for {}", roll_number);
            String::new()
        }
    }
}

fn parse_html_to_text_regex(html_string: &str) -> String {
    let re = Regex::new(r"<[^>]*>").unwrap();
    re.replace_all(html_string, "").to_string()
}

fn get_capture_group(result_text: &str, pattern: &str) -> Option<String> {
    let regex = Regex::new(pattern).unwrap();
    regex
        .captures(result_text)
        .map(|captures| captures.get(1).unwrap().as_str().trim().to_string())
}

fn result_status(result_text: &str) -> String {
    let students_name = get_capture_group(result_text, r"Student's Name\s*(.*?)\s*Registration");
    let class_roll = get_capture_group(result_text, r"Class Roll\s*(.*?)\s*Exam Year");
    let exam_roll = get_capture_group(result_text, r"Exam Roll\s*(.*?)\s*Class Roll");

    if let Some(passed_subjects) = Regex::new(r"Passed\s*(.*)").unwrap().captures(result_text) {
        let passed_subjects = passed_subjects.get(1).unwrap().as_str().trim();
        if let (Some(students_name), Some(class_roll), Some(exam_roll)) =
            (students_name, class_roll, exam_roll)
        {
            return format!(
                "Roll: {} {}, Exam Roll: {} Passed {}",
                class_roll, students_name, exam_roll, passed_subjects
            );
        }
    } else if let Some(referred_subjects) = Regex::new(r"Referred\s*(.*)")
        .unwrap()
        .captures(result_text)
    {
        let referred_subjects = referred_subjects.get(1).unwrap().as_str().trim();
        if let (Some(students_name), Some(class_roll), Some(exam_roll)) =
            (students_name, class_roll, exam_roll)
        {
            return format!(
                "Roll: {} {}, Exam Roll: {} Referred: {}",
                class_roll, students_name, exam_roll, referred_subjects
            );
        }
    }

    result_text.to_string()
}
