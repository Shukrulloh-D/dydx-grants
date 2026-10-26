import './grant-filter.css';
export default function GrantFilter({ options, current, onChange }) {
  return (
    <div className="tabs-container">
      {options.map(f => (
        <button key={f} className={`tab-btn text-mono ${current === f ? 'active' : ''}`} onClick={() => onChange(f)}>{f}</button>
      ))}
    </div>
  );
}
