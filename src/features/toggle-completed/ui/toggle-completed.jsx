import './toggle-completed.css';
export default function ToggleCompleted({ checked, onChange, label }) {
  return (
    <div className="toggle-wrapper">
      <label className="toggle">
        <input type="checkbox" checked={checked} onChange={onChange} />
        <span className="slider"></span>
      </label>
      <span className="text-mono text-muted">{label}</span>
    </div>
  );
}
