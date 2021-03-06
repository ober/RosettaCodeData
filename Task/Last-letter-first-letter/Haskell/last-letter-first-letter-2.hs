import Data.List

allPokemon = words
    "audino bagon baltoy banette bidoof braviary bronzor carracosta charmeleon \
    \cresselia croagunk darmanitan deino emboar emolga exeggcute gabite \
    \girafarig gulpin haxorus heatmor heatran ivysaur jellicent jumpluff kangaskhan \
    \kricketune landorus ledyba loudred lumineon lunatone machamp magnezone mamoswine \
    \nosepass petilil pidgeotto pikachu pinsir poliwrath poochyena porygon2 \
    \porygonz registeel relicanth remoraid rufflet sableye scolipede scrafty seaking \
    \sealeo silcoon simisear snivy snorlax spoink starly tirtouga trapinch treecko \
    \tyrogue vigoroth vulpix wailord wartortle whismur wingull yamask"

growChains :: [[String]] -> [String]
growChains pcs
    | nextChainSet == [] = head pcs
    | otherwise = growChains nextChainSet
  where nextChainSet = pcs >>= findLinks
        findLinks pc = map (\x -> pc ++ [x]) $ filter (isLink $ last pc) (allPokemon \\ pc)
        isLink pl pr = last pl == head pr

main = mapM_ putStrLn $ growChains $ map (\x -> [x]) allPokemon
