function solution(dice) {
    const compared = [];
    var result = {
        dices: [],
        win: 0,
    }
    
    const getAllPoint = (dices, depth = 0, sum = 0, result) => {
        if (depth === dices.length) {
            result.set(sum, (result.get(sum) || 0) + 1);
            return;
        }        
        
        for (const value of dices[depth]) {
            getAllPoint(dices, depth + 1, sum + value, result);
        }
        
        return result;
    }
    
    const calculate = (a) => {
        const b = [];
        const aDices = [];
        const bDices = [];
        for (let i = 0; i < dice.length; i++) {
            if (a.includes(i)) {
                aDices.push(dice[i]);
            } else {
                b.push(i);
                bDices.push(dice[i]);
            }
        }
        
        compared.push(a.join(','));
        compared.push(b.join(','));
        
        const aPoints = getAllPoint(aDices, 0, 0, new Map());
        const bPoints = getAllPoint(bDices, 0, 0, new Map());
        
        let win = 0;
        let lose = 0;
        
        for (const aP of aPoints.keys()) {
            for (const bP of bPoints.keys()) {
                
                let count = aPoints.get(aP) * bPoints.get(bP); 
                if (aP > bP) {
                    win += count;
                } else if (bP > aP) {
                    lose += count;
                }
            }
        }
        
        return {
            dices: win > lose ? a : b,
            win: win > lose ? win : lose,
        }
    }
    
    const dfs = (index, a) => {
        if (a.length === dice.length / 2) {
            if (compared.includes(a.join(','))) return;
            const curResult = calculate(a);
            if (curResult.win > result.win) {
                result.dices = [...curResult.dices];
                result.win = curResult.win;
            };
            return;
        }
        
        for (let i = index; i < dice.length; i++) {
            a.push(i);
            dfs(i + 1, a);
            a.pop();
        }
    }
    
    dfs(0, []);
    
    return result.dices.map((i) => i + 1);
}

console.log(solution([[1, 2, 3, 4, 5, 6], [3, 3, 3, 3, 4, 4], [1, 3, 3, 4, 4, 4], [1, 1, 4, 4, 5, 5]]));

// 주사위 고르기 (Lv3)