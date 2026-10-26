import { FaqAccordion } from '@/widgets/faq-accordion';
import { CtaBanner } from '@/widgets/cta-banner';
import { faqData } from '@/shared/mock/data';
import './faq-page.css';

export default function FaqPage() {
  return (
    <div className="container page-wrapper" style={{ paddingTop: '80px', maxWidth: '900px', margin: '0 auto' }}>
      <h1 className="title-h1 text-center mb-60">Frequently asked questions</h1>
      <h3 className="mb-40" style={{ fontSize: '20px' }}>Grant application process</h3>
      <FaqAccordion items={faqData} />
      <h3 className="mt-60 mb-40" style={{ fontSize: '20px' }}>Selection criteria</h3>
      <FaqAccordion items={[
        { q: 'What is the dYdX Grants Trust?', a: 'It is a trust that manages the grants program.' },
        { q: 'Where are funds held?', a: 'Funds are held in a multisig wallet.' }
      ]} />
      <CtaBanner />
    </div>
  );
}
