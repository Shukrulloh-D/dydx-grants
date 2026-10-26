import { useState } from 'react';
import { RfpRow } from '@/entities/rfp-row';
import { GrantFilter } from '@/features/grant-filter';
import { CtaBanner } from '@/widgets/cta-banner';
import { rfps } from '@/shared/mock/data';
import './rfps-page.css';

export default function RfpsPage() {
  const [filter, setFilter] = useState('All');
  const filtered = filter === 'All' ? rfps : rfps.filter(r => r.status === filter);

  return (
    <div className="container page-wrapper">
      <div className="text-center mb-40">
        <h1 className="title-h1">Discover initiatives (RFPs)</h1>
        <p className="text-muted">This list includes initial ideas that we think could make excellent Grants.</p>
      </div>
      <GrantFilter options={['All', 'Open', 'Funded', 'Completed']} current={filter} onChange={setFilter} />
      <div className="rfp-list">
        {filtered.length > 0 ? filtered.map(rfp => <RfpRow key={rfp.id} rfp={rfp} />) : <p className="text-center text-muted">No RFPs found.</p>}
      </div>
      <CtaBanner />
    </div>
  );
}
