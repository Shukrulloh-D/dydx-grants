import { ExpenseRow } from '@/entities/expense-row';
import { GrantFilter } from '@/features/grant-filter';
import './expenses-page.css';

const mockExpenses = [
  { id: 1, title: 'Airtable Yearly Subscription', type: 'Vendor', amount: '$850.00' },
  { id: 2, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
  { id: 3, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
  { id: 4, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
];

export default function ExpensesPage() {
  return (
    <div className="container page-wrapper">
      <div className="text-center mb-40"><h1 className="title-h1">Program expenses</h1></div>
      <GrantFilter options={['All', 'Vendor', 'Salary', 'Software']} current="All" onChange={() => {}} />
      <div className="expense-list">
        {mockExpenses.map(e => <ExpenseRow key={e.id} expense={e} />)}
      </div>
    </div>
  );
}
