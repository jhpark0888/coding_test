function solution(edges) {
    const graphInfo = {};
    
    for (const [start, end] of edges) {
        graphInfo[start] ||= { inCount: 0, outCount: 0 }
        graphInfo[end] ||= { inCount: 0, outCount: 0 }
        
        graphInfo[start].outCount++;
        graphInfo[end].inCount++;
    }
    
    let staticNum = 0;
    let graphCount = 0;
    let donutCount = 0;
    let barCount = 0;
    let eightCount = 0;
    
    for (let i in graphInfo) {
        const {inCount, outCount} = graphInfo[i];
        
        if (outCount >= 2 && inCount === 0) {
            staticNum = +i;
            graphCount = outCount;
            continue;
        }
        
        if (outCount === 0) barCount++;
        if (inCount >= 2 && outCount >= 2) eightCount++;
    }
    
    donutCount = graphCount - barCount - eightCount;
    
    return [staticNum, donutCount, barCount, eightCount];
}

console.log(solution([[4, 11], [1, 12], [8, 3], [12, 7], [4, 2], [7, 11], [4, 8], [9, 6], [10, 11], [6, 10], [3, 5], [11, 1], [5, 3], [11, 9], [3, 8]]));

// 도넛과 막대 그래프 (Lv2)