/* eslint-disable @typescript-eslint/no-explicit-any */
import Answer from "./components/Answer";
import Card from "./components/Card";

function shuffle(array: string[]) {
  let currentIndex = array.length,
    randomIndex;

  while (currentIndex > 0) {
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex--;
    [array[currentIndex], array[randomIndex]] = [array[randomIndex], array[currentIndex]];
  }

  return array;
}

function App() {
  const files = import.meta.env.VITE_CHARACTERS.split(", ");

  const cards = shuffle(files).map((characterName) => {
    return <Card key={characterName} characterName={characterName} imagePath={`/characters/${characterName}`} />;
  });

  const answer = files[Math.floor(Math.random() * files.length)];

  return (
    <>
      <h1 style={{ textAlign: "center" }}>Guess Who?</h1>
      <main style={{ maxWidth: "100%", display: "grid", gridTemplateColumns: "auto 400px" }}>
        <ul
          style={{
            listStyle: "none",
            display: "grid",
            gridTemplateColumns: "repeat(5, 130px)",
            gridTemplateRows: "repeat(5, 275px)",
          }}
        >
          {cards}
        </ul>
        <Answer characterName={answer} imagePath={`/characters/${answer}`} />
      </main>
    </>
  );
}

export default App;
