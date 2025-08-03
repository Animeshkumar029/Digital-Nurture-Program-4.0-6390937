import React from 'react';

const IndianPlayers = () => {
  const T20players = ["Virat", "Rohit", "Dhoni", "Hardik", "Gill"];
  const RanjiTrophy = ["Pujara", "Rahane", "Shaw", "Iyer", "Jaiswal"];

  const allPlayers = [...T20players, ...RanjiTrophy];

  const oddTeam = allPlayers.filter((_, i) => i % 2 !== 0);
  const evenTeam = allPlayers.filter((_, i) => i % 2 === 0);

  return (
    <div>
      <h2>Merged Players:</h2>
      <ul>
        {allPlayers.map((player, index) => (
          <li key={index}>{player}</li>
        ))}
      </ul>

      <h2>Odd Team Players:</h2>
      <ul>
        {oddTeam.map((player, index) => (
          <li key={index}>{player}</li>
        ))}
      </ul>

      <h2>Even Team Players:</h2>
      <ul>
        {evenTeam.map((player, index) => (
          <li key={index}>{player}</li>
        ))}
      </ul>
    </div>
  );
};

export default IndianPlayers;
