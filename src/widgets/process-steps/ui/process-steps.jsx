import './process-steps.css';
export default function ProcessSteps() {
  return (
    <div className="process-wrapper">
      <div className="process-steps">
        <div className="step-card step-1">
          <span className="step-num">1</span>
          <h3>Apply</h3>
          <p>Submit a complete application to the dYdX Grants Team including as many details as possible about the proposed idea.</p>
        </div>
        <div className="step-card step-2">
          <span className="step-num">2</span>
          <h3>Interview</h3>
          <p>If selected, the dYdX Grants Team will conduct 1-2 interviews to collect more information on the background.</p>
        </div>
        <div className="step-card step-3">
          <span className="step-num">3</span>
          <h3>Grant offer</h3>
          <p>The dYdX Grants Team will determine if the proposal fits into the grant program. A vesting schedule will be determined.</p>
        </div>
      </div>
    </div>
  );
}
