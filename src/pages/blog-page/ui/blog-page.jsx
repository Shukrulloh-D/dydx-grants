import { ArticleCard } from '@/entities/article-card';
import { BlogLoadMore } from '@/features/blog-load-more';
import { GrantFilter } from '@/features/grant-filter';
import { blogPosts } from '@/shared/mock/data';
import './blog-page.css';

export default function BlogPage() {
  return (
    <div className="container page-wrapper">
      <div className="text-center mb-40"><h1 className="title-h1">Blog</h1></div>
      <GrantFilter options={['Latest', 'Funding round', 'Spotlight', 'News']} current="Latest" onChange={() => {}} />
      <div className="grid-2">
        <BlogLoadMore total={blogPosts.length} initial={4} step={2}>
          {(visible) => blogPosts.slice(0, visible).map(post => <ArticleCard key={post.id} post={post} />)}
        </BlogLoadMore>
      </div>
    </div>
  );
}
