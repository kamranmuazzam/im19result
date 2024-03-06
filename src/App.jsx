import { createSignal } from "solid-js";
import { invoke } from "@tauri-apps/api/tauri";
import "./App.css";
// import { resultProcessor } from "./resultProcessorr.js";
// resultProcessor();
function App() {
  const [rollNumber, setRollNumber] = createSignal("");
  const [result, setResult] = createSignal("");
  const [name, setName] = createSignal("---");
  const [examRoll, setExamRoll] = createSignal("---");
  const [resultStatus, setResultStatus] = createSignal("---");
  const [resultColor, setResultColor] = createSignal("");
  const [messegeColor, setMessegeColor] = createSignal("");
  const [profNumber, setProf] = createSignal(124);

  async function fetchResult() {
    console.log("in fetch result");
    setName("---");
    setExamRoll("---");
    setResultStatus("---");
    setResult("---");
    setResultColor("");
    setMessegeColor("");
    try {
      const r = parseInt(rollNumber()) + 9775;
      const rr = r.toString();
      const resultTextHTML = await invoke("fetch_result", {
        rollNumber: rr,
        examId: profNumber().toString(),
      });
      const parseHTMLToText = (htmlString) => {
        const parser = new DOMParser();
        const parsedDocument = parser.parseFromString(htmlString, "text/html");
        return parsedDocument.body.textContent;
      };
      const resultText = parseHTMLToText(resultTextHTML);
      setResult(resultText);
      const regexPassed = /Passed(.*)/;
      const regexReferred = /Referred(.*)/;
      const matchPassed = resultText.match(regexPassed);
      const studentsName = resultText
        .match(/(?<=Student's Name)(.*)(?=Registration)/)[0]
        .trim();
      const classRoll = resultText
        .match(/(?<=Class Roll)(.*)(?=Exam Year)/)[0]
        .trim();
      const examRoll = resultText
        .match(/(?<=Exam Roll)(.*)(?=Class Roll)/)[0]
        .trim();
      const particulars = `Roll: ${classRoll} | Name: ${studentsName}`;
      setName(studentsName);
      setExamRoll(examRoll);
      if (matchPassed) {
        const passedSubjects = matchPassed[1].trim();
        setResult(
          `${particulars}, Exam Roll: ${examRoll} Passed: ${passedSubjects}`,
        );
        setResultStatus("Passed");
        setResultColor("green");
      } else {
        const matchReferred = resultText.match(regexReferred);
        if (matchReferred) {
          const referredSubjects = matchReferred[1].trim();
          setResult(
            `${particulars}, Exam Roll: ${examRoll} Referred: ${referredSubjects}`,
          );
          setResultStatus("Referred: " + referredSubjects);
          setResultColor("Red");
        } else {
          setResult(resultText);
        }
      }
    } catch (error) {
      console.error("Error fetching result:", error);
      setMessegeColor("purple");
      // setResult(resultText);
    }
  }

  return (
    <div className="">
      <div
        style={{
          display: "flex",
          flexDirection: "row",
          justifyContent: "center",
        }}
      >
        {/* // 726, 3rd profNumber nov 2023
          // 725, 2nd profNumber nov 2023 (ylma)
          // 365, 2nd profNumber nov 2022
          // 124, 1st profNumber may 2021 */}
        <button
          style={{ background: profNumber() === 124 ? "green" : "" }}
          onClick={() => {
            setProf(124);
          }}
        >
          1st Prof
        </button>
        <button
          style={{ background: profNumber() === 365 ? "green" : "" }}
          onClick={() => setProf(365)}
        >
          2nd Prof
        </button>
        <button
          style={{ background: profNumber() === 726 ? "green" : "" }}
          onClick={() => setProf(726)}
        >
          3rd Prof
        </button>
        <button
          style={{
            background: profNumber() === 4 ? "green" : "",
          }}
          onClick={() => setProf(4)}
        >
          4th Prof
        </button>
      </div>
      <p> </p>
      <form
        onSubmit={(e) => {
          e.preventDefault();
          fetchResult();
        }}
      >
        {" Roll Number "}
        <input
          onInput={(e) => setRollNumber(e.currentTarget.value)}
          value={rollNumber()}
          autofocus="autofocus"
          // placeholder="Roll Number"
        />
        <button style={{ background: "orange" }} type="submit">
          Check
        </button>
      </form>
      <p>Roll Number: {rollNumber()}</p>
      {/* <div innerHTML={result()}></div> */}
      <div>
        <ul style={{ background: messegeColor() }}>{result()}</ul>
        <ul>Name : {name()}</ul>
        <ul>Exam Roll : {examRoll()}</ul>
        <ul style={{ background: resultColor() }}>Result : {resultStatus()}</ul>
      </div>
    </div>
  );
}

export default App;
