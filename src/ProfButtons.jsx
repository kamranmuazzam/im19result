import { createSignal } from "solid-js";

function ProfButtons() {
  const [profNumber, setProf] = createSignal(124);

  return (
    <div
      style={{
        display: "flex",
        flexDirection: "row",
        justifyContent: "center",
      }}
    >
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
  );
}

export default ProfButtons;
