import React from 'react';

function IndianPlayers() {
  // Team array
  const team = ['Rohit', 'Virat', 'Rahul', 'Pant', 'Jadeja', 'Hardik'];

  // Destructuring into Odd and Even team players
  const oddPlayers = team.filter((_, index) => index % 2 !== 0);
  const evenPlayers = team.filter((_, index) => index % 2 === 0);

  // Arrays for T20 and Ranji Trophy players
  const T20Players = ['Bumrah', 'Surya', 'Gill'];
  const RanjiPlayers = ['Pujara', 'Rahane'];

  // Merge arrays using spread operator
  const mergedPlayers = [...T20Players, ...RanjiPlayers];

  return (
    <div>
      <h2>Odd Team Players</h2>
      <ul>
        {oddPlayers.map((player, index) => <li key={index}>{player}</li>)}
      </ul>

      <h2>Even Team Players</h2>
      <ul>
        {evenPlayers.map((player, index) => <li key={index}>{player}</li>)}
      </ul>

      <h2>Merged Players (T20 + Ranji Trophy)</h2>
      <ul>
        {mergedPlayers.map((player, index) => <li key={index}>{player}</li>)}
      </ul>
    </div>
  );
}

export default IndianPlayers;
