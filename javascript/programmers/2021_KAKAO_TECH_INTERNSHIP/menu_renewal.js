function solution(orders, course) {
    var answer = [];
    
    const dfs = (menus, counts, index, str, length) => {
        if (length === 0) {
            if (counts.has(str)) {
                counts.set(str, counts.get(str) + 1);
            } else {
                counts.set(str, 1);
            }
            
            return;
        }
        
        for (let i = index; i < menus.length; i++) {
            const menu = menus[i];
            dfs(menus, counts, i + 1, str + menu, length - 1);
        }
    }
    
    for (const courseCount of course) {
        const counts = new Map();
        for (const order of orders) {
            const menus = order.split("").sort();
            dfs(menus, counts, 0, "", courseCount);
        }
        
        const maxCount = Math.max(...counts.values());
        if (maxCount <= 1) continue;
        for (const [k, v] of counts.entries()) {
            if (v === maxCount) answer.push(k);
        }
    }
    
    return answer.sort();
}

console.log(solution(["XYZ", "XWY", "WXA"], [2,3,4]));

// 메뉴 리뉴얼 (Lv2)