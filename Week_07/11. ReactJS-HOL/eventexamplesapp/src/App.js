import React, { useState } from 'react';
import './App.css';

function App() {
  const [count, setCount] = useState(0);
  const [message, setMessage] = useState('');

  const increment = () => {
    setCount(prev => prev + 1);
    sayHello();
  };

  const decrement = () => {
    setCount(prev => prev - 1);
  };

  const sayHello = () => {
    console.log('Hello! Static message: This is a React event handler example.');
  };

  const sayWelcome = (msg) => {
    setMessage(msg);
  };

  const handleClick = (event) => {
    alert('I was clicked');
  };

  return (
    <div className="App">
      <h1>React Event Examples</h1>
      <p>Count: {count}</p>
      <button onClick={increment}>Increment</button>
      <button onClick={decrement}>Decrement</button>
      <br /><br />
      <button onClick={() => sayWelcome('Welcome to the event handler demo!')}>Say Welcome</button>
      <p>{message}</p>
      <button onClick={handleClick}>Synthetic Event Button</button>
      <CurrencyConvertor />
    </div>
  );
}

function CurrencyConvertor() {
  const [rupees, setRupees] = useState('');
  const [euros, setEuros] = useState('');

  const handleSubmit = () => {
    const converted = parseFloat(rupees) / 90;
    setEuros(converted.toFixed(2));
  };

  return (
    <div>
      <h2>Currency Convertor</h2>
      <input
        type="number"
        value={rupees}
        onChange={(e) => setRupees(e.target.value)}
        placeholder="Enter amount in INR"
      />
      <button onClick={handleSubmit}>Convert</button>
      <p>EUR: €{euros}</p>
    </div>
  );
}

export default App;
