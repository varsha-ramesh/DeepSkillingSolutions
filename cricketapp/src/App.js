import React from 'react';
import ListofPlayers from './Components/ListofPlayers';
import IndianPlayers from './Components/IndianPlayers';

function App() {
  const flag = false; // Change to false to show IndianPlayers instead

  return (
    <div className="App">
      <h1>Cricket App</h1>
      {flag ? <ListofPlayers /> : <IndianPlayers />}
    </div>
  );
}

export default App;
