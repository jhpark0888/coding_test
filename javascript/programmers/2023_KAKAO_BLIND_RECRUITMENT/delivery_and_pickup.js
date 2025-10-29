function solution(cap, n, deliveries, pickups) {    
    while (deliveries[deliveries.length - 1] === 0) deliveries.pop();
    while (pickups[pickups.length - 1] === 0) pickups.pop();
    let answer = 0;
    let deliverCap = 0;
    let pickUpCap = 0;
    
    while (deliveries.length > 0 || pickups.length > 0) {
        const dDistance = deliveries.length;
        const pDistance = pickups.length;
        
        while (deliveries.length > 0 && deliverCap < cap) {            
            const d = Math.min(deliveries[deliveries.length - 1], cap - deliverCap);
            deliverCap += d;
            deliveries[deliveries.length - 1] -= d;
            while (deliveries[deliveries.length - 1] === 0) deliveries.pop();
        } 
        
        while (pickups.length > 0 && pickUpCap < cap) {
            const p = Math.min(pickups[pickups.length - 1], cap - pickUpCap);
            pickUpCap += p;
            pickups[pickups.length - 1] -= p;
            while (pickups[pickups.length - 1] === 0) pickups.pop();
        }

        deliverCap = 0;
        pickUpCap = 0;
        answer += Math.max(dDistance, pDistance) * 2;
    }
      
    return answer;
}

console.log(solution(2, 5, [50, 0, 0, 0, 2], [50, 0, 0, 0, 0]))

// 택배 배달과 수거하기 (Lv2)