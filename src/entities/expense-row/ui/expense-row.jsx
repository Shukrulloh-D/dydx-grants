import './expense-row.css';
export default function ExpenseRow({ expense }) {
  return (
    <div className="expense-row">
      <div className="expense-info">
        <h3 className="expense-title">{expense.title}</h3>
        <p className="expense-type text-mono text-muted">{expense.type}</p>
      </div>
      <div className="expense-amount text-mono text-muted">
        {expense.amount} 
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6M15 3h6v6M10 14L21 3"/></svg>
      </div>
    </div>
  );
}
