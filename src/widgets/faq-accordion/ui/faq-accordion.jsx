import { useState } from 'react';
import './faq-accordion.css';
export default function FaqAccordion({ items }) {
  const [openIndex, setOpenIndex] = useState(null);
  return (
    <div className="faq-accordion">
      {items.map((item, index) => (
        <div key={index} className="faq-item">
          <button className="faq-question" onClick={() => setOpenIndex(openIndex === index ? null : index)}>
            {item.q}
            <span className={`faq-icon ${openIndex === index ? 'open' : ''}`}>
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M12 5v14M5 12h14"/></svg>
            </span>
          </button>
          <div className={`faq-answer-wrapper ${openIndex === index ? 'open' : ''}`}>
            <div className="faq-answer"><p>{item.a}</p></div>
          </div>
        </div>
      ))}
    </div>
  );
}
