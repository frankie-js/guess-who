import { MouseEventHandler, useState } from "react";

function Card({ characterName, imagePath }: { characterName: string; imagePath: string }) {
  const [clicked, setClicked] = useState(false);
  const [hover, setHover] = useState(false);

  const visibility = clicked ? "hidden" : "visible";
  const transition = clicked ? "all 0s" : "ease-in-out 0.2s";

  const backgroundColor = hover ? "orangered" : "rgb(233, 233, 233)";
  const color = hover ? "white" : "black";

  const handleClick: MouseEventHandler = (event) => {
    event.preventDefault();
    setClicked(true);
  };

  const toggleHover: MouseEventHandler = () => {
    setHover(!hover);
  };

  return (
    <li
      style={{
        margin: "5%",
        padding: "5%",
        visibility: visibility,

        cursor: "pointer",
        textAlign: "center",
        color: color,
        backgroundColor: backgroundColor,
        transition: transition,
      }}
      onClick={handleClick}
      onMouseEnter={toggleHover}
      onMouseLeave={toggleHover}
    >
      <img src={imagePath} style={{ width: "100%" }} />
      <p>{characterName}</p>
    </li>
  );
}

export default Card;
