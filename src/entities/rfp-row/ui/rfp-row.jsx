import { Tag } from '@/shared/ui/tag';
import './rfp-row.css';
export default function RfpRow({ rfp }) {
  return (
    <div className="rfp-row">
      <div className="rfp-info">
        <h3 className="rfp-title">{rfp.title}</h3>
        <p className="rfp-desc">{rfp.description}</p>
        <p className="rfp-amount text-mono text-muted">Funding amount: {rfp.amount}</p>
      </div>
      <Tag text={rfp.status} status={rfp.status} />
    </div>
  );
}
