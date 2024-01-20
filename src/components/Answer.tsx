function Answer({ characterName, imagePath }: { characterName: string; imagePath: string }) {
  return (
    <div
      style={{
        width: "20%",
        position: "absolute",
        right: "5%",
        textAlign: "center",
        backgroundColor: "rgb(228, 228, 228)",
        padding: "10px",
        top: "50%",
        transform: "translateY(-50%)",
      }}
    >
      <img
        src={imagePath}
        style={{
          margin: "5%",
          padding: "5%",
          width: "80%",
          display: "block",
          marginLeft: "auto",
          marginRight: "auto",
        }}
      ></img>
      <h2 style={{ textAlign: "center" }}>{characterName}</h2>
    </div>
  );
}

export default Answer;
