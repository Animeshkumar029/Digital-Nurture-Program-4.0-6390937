import React from 'react';

const offices = [
  { name: "Office One", rent: 45000, address: "123 Main Street" },
  { name: "Office Two", rent: 70000, address: "456 Market Road" },
  { name: "Office Three", rent: 60000, address: "789 Business Ave" }
];

function App() {
  return (
    <div>
      <h1>Office Space Rental App</h1>
      <img src="https://via.placeholder.com/600x200" alt="Office Space" />
      <ul>
        {offices.map((office, index) => (
          <li key={index}>
            <p><strong>Name:</strong> {office.name}</p>
            <p style={{ color: office.rent < 60000 ? 'red' : 'green' }}>
              <strong>Rent:</strong> ₹{office.rent}
            </p>
            <p><strong>Address:</strong> {office.address}</p>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;
