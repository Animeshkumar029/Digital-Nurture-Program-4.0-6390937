import React from 'react';

const ListOfPlayers = () => {
  const players = [
    { name: "Virat", score: 85 },
    { name: "Rohit", score: 45 },
    { name: "Dhoni", score: 75 },
    { name: "Hardik", score: 60 },
    { name: "Jadeja", score: 90 },
    { name: "Gill", score: 40 },
    { name: "Bumrah", score: 88 },
    { name: "Kohli", score: 55 },
    { name: "Surya", score: 78 },
    { name: "Rahul", score: 70 },
    { name: "Shami", score: 65 }
  ];

  const filteredPlayers = players.filter(player => player.score < 70);

  return (
    <div>
      <h2>All Players:</h2>
      <ul>
        {players.map((player, index) => (
          <li key={index}>{player.name} - {player.score}</li>
        ))}
      </ul>

      <h2>Filtered Players (Score &lt; 70):</h2>
      <ul>
        {filteredPlayers.map((player, index) => (
          <li key={index}>{player.name} - {player.score}</li>
        ))}
      </ul>
    </div>
  );
};

export default ListOfPlayers;
