import { useState, useMemo } from 'react';
import { GrantCard } from '@/entities/grant-card';
import { GrantFilter } from '@/features/grant-filter';
import { ToggleCompleted } from '@/features/toggle-completed';
import { CtaBanner } from '@/widgets/cta-banner';
import { grants } from '@/shared/mock/data';
import './funded-grants-page.css';

export default function FundedGrantsPage() {
  const [showCompleted, setShowCompleted] = useState(false);
  const [filter, setFilter] = useState('All');

  const filteredGrants = useMemo(() => {
    return grants.filter(g => {
      const matchStatus = showCompleted ? g.isCompleted : true;
      const matchCategory = filter === 'All' ? true : g.category === filter;
      return matchStatus && matchCategory;
    });
  }, [showCompleted, filter]);

  return (
    <div className="container page-wrapper">
      <div className="text-center mb-40"><h1 className="title-h1">Funded grants</h1></div>
      <GrantFilter options={['All', 'Crowdfund', 'Edition', 'Entry', 'Education']} current={filter} onChange={setFilter} />
      <ToggleCompleted checked={showCompleted} onChange={() => setShowCompleted(!showCompleted)} label="Show only completed" />
      <div className="grid-3">
        {filteredGrants.length > 0 ? filteredGrants.map(grant => <GrantCard key={grant.id} grant={grant} />) : <p className="text-muted text-center" style={{gridColumn: '1 / -1'}}>No grants match your criteria.</p>}
      </div>
      <CtaBanner />
    </div>
  );
}
