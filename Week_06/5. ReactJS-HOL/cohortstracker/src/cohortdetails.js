import React from "react";
import './cohortdetails.css'; // Regular CSS

function CohortDetails({ cohort }) {
  const { name, startedOn, status, coach, trainer } = cohort;

  const titleColor = status.toLowerCase() === "ongoing" ? "green" : "blue";

  return (
    <div className="box">
      <h3 style={{ color: titleColor }}>{name}</h3>
      <dl>
        <dt>Started On</dt>
        <dd>{startedOn}</dd>

        <dt>Current Status</dt>
        <dd>{status}</dd>

        <dt>Coach</dt>
        <dd>{coach}</dd>

        <dt>Trainer</dt>
        <dd>{trainer}</dd>
      </dl>
    </div>
  );
}

export default CohortDetails;