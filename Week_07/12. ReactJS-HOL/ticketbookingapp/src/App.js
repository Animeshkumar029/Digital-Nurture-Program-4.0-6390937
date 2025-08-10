import React, { useState } from 'react';
import './App.css';

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleLogin = () => setIsLoggedIn(true);
  const handleLogout = () => setIsLoggedIn(false);

  let page;
  if (isLoggedIn) {
    page = <UserPage />;
  } else {
    page = <GuestPage />;
  }

  return (
    <div className="App">
      <h1>Ticket Booking App</h1>
      {isLoggedIn ? (
        <button onClick={handleLogout}>Logout</button>
      ) : (
        <button onClick={handleLogin}>Login</button>
      )}
      {page}
    </div>
  );
}

function GuestPage() {
  return (
    <div>
      <h2>Welcome Guest!</h2>
      <p>Flight details: XYZ123, Departure: Delhi, Arrival: Mumbai</p>
      <p>Please login to book tickets.</p>
    </div>
  );
}

function UserPage() {
  return (
    <div>
      <h2>Welcome User!</h2>
      <p>Flight details: XYZ123, Departure: Delhi, Arrival: Mumbai</p>
      <button>Book Ticket</button>
    </div>
  );
}

export default App;
