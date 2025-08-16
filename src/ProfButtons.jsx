import { createSignal } from "solid-js";

export default function ProfButtons({ profNumber, setProf }) {
  const buttonStyle = (number) => ({
    background: profNumber() === number ? "green" : "",
  });

  return (
    <div
      style={{
        display: "flex",
        flexDirection: "row",
        justifyContent: "center",
      }}
    >
      <button style={buttonStyle(124)} onClick={() => setProf(124)}>
        1st Prof
      </button>
      <button style={buttonStyle(365)} onClick={() => setProf(365)}>
        2nd Prof
      </button>
      <button style={buttonStyle(726)} onClick={() => setProf(726)}>
        3rd Prof
      </button>
      <button style={buttonStyle(4)} onClick={() => setProf(1340)}>
        4th Prof
      </button>
    </div>
  );
}
