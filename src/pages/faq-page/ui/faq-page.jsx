import { FaqAccordion } from '@/widgets/faq-accordion';
import { CtaBanner } from '@/widgets/cta-banner';
import { faqData } from '@/shared/mock/data';
import './faq-page.css';

export default function FaqPage() {
  return (
    <div className="container page-wrapper" style={{ paddingTop: '80px', maxWidth: '900px', margin: '0 auto' }}>
      <h1 className="title-h1 text-center mb-60">Frequently asked questions</h1>
      
      {/* Блок 1 */}
      <div className="faq-section">
        <h3 className="faq-section-title">Grant application process</h3>
        <FaqAccordion items={faqData} />
      </div>

      {/* Блок 2 */}
      <div className="faq-section mt-60">
        <h3 className="faq-section-title">Selection criteria</h3>
        <FaqAccordion items={[
          { q: 'What is the dYdX Grants Trust?', a: 'It is a trust that manages the grants program.' },
          { q: 'Where are funds held?', a: 'Funds are held in a multisig wallet.' },
          { q: 'When was the program launched?', a: 'The program was launched in 2021.' },
          { q: 'Who are the Trustees?', a: 'The trustees are members of the community.' }
        ]} />
      </div>

      {/* Блок 3 */}
      <div className="faq-section mt-60">
        <h3 className="faq-section-title">The Grants Trust</h3>
        <FaqAccordion items={[
          { q: 'What is the dYdX Grants Trust?', a: 'It is a trust that manages the grants program.' },
          { q: 'Where are funds held?', a: 'Funds are held in a multisig wallet.' },
          { q: 'Who are the Trustees?', a: 'The trustees are members of the community.' },
          { q: 'Who is the Enforcer?', a: 'The Enforcer oversees the trust.' }
        ]} />
      </div>

      <CtaBanner />
    </div>
  );
}
