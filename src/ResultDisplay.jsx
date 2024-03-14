export default function ResultDisplay({
  rollNumber,
  name,
  examRoll,
  resultStatus,
  resultColor,
  messegeColor,
  loadDash,
}) {
  return (
    <div style={{ background: resultColor() }}>
      <div style={{ background: messegeColor() }}>
        <p>Roll Number: {rollNumber()}</p>
        <ul>{result()}</ul>
        <ul>Name : {!name() ? loadDash() : name()}</ul>
        <ul>Exam Roll : {!examRoll() ? loadDash() : examRoll()}</ul>
        <ul>Result : {!resultStatus() ? loadDash() : resultStatus()}</ul>
      </div>
    </div>
  );
}
