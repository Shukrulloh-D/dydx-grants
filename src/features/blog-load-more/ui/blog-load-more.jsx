import { Button } from '@/shared/ui/button';
import { useState } from 'react';
export default function BlogLoadMore({ total, initial = 4, step = 2, children }) {
  const [visible, setVisible] = useState(initial);
  const hasMore = visible < total;
  return (
    <div>
      {children(visible)}
      {hasMore && (
        <div className="text-center mt-60">
          <Button variant="secondary" onClick={() => setVisible(v => v + step)}>Load more posts</Button>
        </div>
      )}
    </div>
  );
}
