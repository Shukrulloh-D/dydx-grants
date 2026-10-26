import { Link } from 'react-router-dom';
import './article-card.css';

export default function ArticleCard({ post }) {
  return (
    <Link to={`/blog/${post.id}`} className="article-card">
      <div className="article-image-wrapper">
        <div className="article-image-inner">
           <span className="article-category text-mono text-muted">{post.category}</span>
           <h3 className="article-image-title">{post.title}</h3>
        </div>
      </div>
      <div className="article-content">
        <span className="article-category text-mono text-muted">{post.category}</span>
        <h3 className="article-title">{post.title}</h3>
        <span className="article-date text-mono text-muted">{post.date}</span>
      </div>
    </Link>
  );
}
