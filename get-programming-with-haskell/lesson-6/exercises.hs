-- this will compile but it cannot be evalutated
backwardsInfinity = reverse [1 ..]

--q6.1
myRepeat val = cycle [val]

--q6.2
subseq start end list = take (end - start) (drop start list)

--q6.3
inFirstHalf tgt list = tgt `elem` (take half list)
  where
    half = (length list) `div` 2
