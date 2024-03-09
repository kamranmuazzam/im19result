import { createSignal } from "solid-js";

function ResultDisplay(props) {
  const rollNumber = props.rollNumber;
  const [result, setResult] = createSignal("");
  const [name, setName] = createSignal("---");
  const [examRoll, setExamRoll] = createSignal("---");
  const [resultStatus, setResultStatus] = createSignal("---");
  const [resultColor, setResultColor] = createSignal("");
  const [messageColor, setMessageColor] = createSignal("");

  return (
    <div style={{ background: resultColor() }}>
      <div style={{ background: messageColor() }}>
        <p>Roll Number: {rollNumber()}</p>
        <ul>{result()}</ul>
        <ul>Name : {!name() ? loadDash() : name()}</ul>
        <ul>Exam Roll : {!examRoll() ? loadDash() : examRoll()}</ul>
        <ul>Result : {!resultStatus() ? loadDash() : resultStatus()}</ul>
      </div>
    </div>
  );
}

export default ResultDisplay;
