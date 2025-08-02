import React from 'react';
import Counter from './Components/Counter';
import CurrencyConvertor from './Components/CurrencyConvertor';

function App() {
  return (
    <div className="App" style={{ padding: "20px" }}>
      <h1>React Event Examples</h1>
      <Counter />
      <CurrencyConvertor />
    </div>
  );
}

export default App;
