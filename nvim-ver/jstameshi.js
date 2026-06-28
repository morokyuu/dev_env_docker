const Hoge = () => {
  return (
    <div>
      <h1>こんちわ</h1>
    </div>
  );
}

--------

import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { App } from "./App";

const rootElement = document.getElementById("root");
const root = createRoot(rootElement);

root.render(
  <StrictMode>
    <App />
  </StrictMode>
);

----

import "./styles.css";

export const App = () => {
  return (
    <div>
      <h1>こんちわ</h1>
      <h2>げんき？</h2>
      <button onClick={() => alert()}>ボタン</button>
    </div>
  );
};

--------

style当てる方法

import "./styles.css";

export const App = () => {
  const contentStyle = {
    color: "blue",
    fontSize: "18px",
    margin: 20,
  };
  return (
    <div>
      <h1 style={{ color: "red" }}>こんちわ</h1>
      <h2 style={contentStyle}>げんき？</h2>
      <button onClick={() => alert()}>ボタン</button>
    </div>
  );
};

--------

import "./styles.css";
import { ColorfulMessage } from "./components/ColorfulMessage";

export const App = () => {
  const onClickButton = () => alert();

  const contentStyleA = {
    color: "blue",
    fontSize: "18px",
    margin: 20,
  };

  const contentStyleB = {
    color: "green",
    fontSize: "18px",
    margin: 20,
  };
  return (
    <div>
      <h1 style={{ color: "red" }}>こんちわ</h1>
      <ColorfulMessage color="blue">どやさ</ColorfulMessage>
      <ColorfulMessage color="green">こやさ</ColorfulMessage>
      <ColorfulMessage color="red">げんきですっ</ColorfulMessage>
      <button onClick={onClickButton}>ボタン</button>
    </div>
  );
};

----
export const ColorfulMessage = (props) => {
  console.log(props);

  contentStyleA = {
    color: props.color,
    fontSize: "18px",
  };

  return <p style={contentStyleA}>{props.children}</p>;
};


------------

import "./styles.css";
import { ColorfulMessage } from "./components/ColorfulMessage";

export const App = () => {
  const onClickButton = () => alert();

  return (
    <div>
      <h1 style={{ color: "red" }}>こんちわ</h1>
      <ColorfulMessage color="blue">どやさ</ColorfulMessage>
      <ColorfulMessage color="green">こやさ</ColorfulMessage>
      <ColorfulMessage color="red">げんきですっ</ColorfulMessage>
      <button onClick={onClickButton}>ボタン</button>
    </div>
  );
};


----
export const ColorfulMessage = (props) => {
  console.log(props);
  const { color, children } = props;

  contentStyle = {
    color: color,
    fontSize: "18px",
  };

  return <p style={contentStyle}>{children}</p>;
};


----------------

export const ColorfulMessage = ({ color, children }) => {
  contentStyle = {
    color: color,
    fontSize: "18px",
  };

  return <p style={contentStyle}>{children}</p>;
};

----

import "./styles.css";

import { useState } from "react";
import { ColorfulMessage } from "./components/ColorfulMessage";

export const App = () => {
  const [num, setNum] = useState(0);
  const onClickCountUp = () => {
    setNum(111);
  };

  return (
    <div>
      <h1 style={{ color: "red" }}>こんちわ</h1>
      <ColorfulMessage color="blue">どやさ</ColorfulMessage>
      <ColorfulMessage color="green">こやさ</ColorfulMessage>
      <ColorfulMessage color="red">げんきですっ</ColorfulMessage>
      <button onClick={onClickCountUp}>カウントアップ</button>
      <p>{num}</p>
    </div>
  );
};

----------------

import "./styles.css";

import { useState } from "react";
import { ColorfulMessage } from "./components/ColorfulMessage";

export const App = () => {
  const [num, setNum] = useState(0);
  const [isShowFace, setIsShowFace] = useState(true);
  const onClickCountUp = () => {
    setNum((prev) => prev + 1);
    setNum((prev) => prev + 1);
    //setNum(num + 1);
  };

  const onClickToggle = () => {
    setIsShowFace(!isShowFace);
  };

  return (
    <div>
      <h1 style={{ color: "red" }}>こんちわ</h1>
      <ColorfulMessage color="blue">どやさ</ColorfulMessage>
      <ColorfulMessage color="green">こやさ</ColorfulMessage>
      <ColorfulMessage color="red">げんきですっ</ColorfulMessage>
      <button onClick={onClickCountUp}>カウントアップ</button>
      <button onClick={onClickToggle}>ON/OFF</button>
      {isShowFace && <p>＼(^o^)／</p>}
      <p>{num}</p>
    </div>
  );
};


----



----




----




----





----





----





----
