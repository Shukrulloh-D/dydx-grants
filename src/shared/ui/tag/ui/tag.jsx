import './tag.css';

export const Tag = ({ text, status }) => {
  return <span className={`tag tag-${status.toLowerCase()} text-mono`}>{text}</span>;
};