import React from 'react';

function ListofPlayers() {
  // Array of 11 players with their scores
  const players = [
    { name: 'Rohit', score: 85 },
    { name: 'Virat', score: 95 },
    { name: 'Rahul', score: 60 },
    { name: 'Pant', score: 45 },
    { name: 'Jadeja', score: 70 },
    { name: 'Hardik', score: 30 },
    { name: 'Shami', score: 25 },
    { name: 'Bumrah', score: 10 },
    { name: 'Surya', score: 78 },
    { name: 'Gill', score: 90 },
    { name: 'Siraj', score: 55 }
  ];

  // Filter players with scores below 70 using arrow function
  const lowScorers = players.filter(player => player.score < 70);

  return (
    <div>
      <h2>All Players</h2>
      <ul>
        {players.map((player, index) => (
          <li key={index}>{player.name} - {player.score}</li>
        ))}
      </ul>

      <h2>Players Scoring Below 70</h2>
      <ul>
        {lowScorers.map((player, index) => (
          <li key={index}>{player.name} - {player.score}</li>
        ))}
      </ul>
    </div>
  );
}

export default ListofPlayers;
