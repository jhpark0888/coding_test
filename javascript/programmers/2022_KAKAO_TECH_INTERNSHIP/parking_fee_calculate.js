function solution(fees, records) {
    const [basicTime, basicFee, unitTime, unitFee] = fees;
    const parking = new Map();
    const ENDTIME = 23 * 60 + 59;
    var result = new Map();
    
    for (const record of records) {
        const [time, carNum, inOut] = record.split(" ");
        const [hour, minute] = time.split(':').map(t => Number(t));
        const min = hour * 60 + minute;
        
        if (inOut === "IN") {
            parking.set(carNum, min);
        } else {
            const parkingTime = min - parking.get(carNum);
            const curTime = result.has(carNum) ? result.get(carNum) : 0;
            result.set(carNum, curTime + parkingTime);
            parking.delete(carNum);
        }
    }
    
    for (const [carNum, parkingTime] of parking.entries()) {
        const curTime = result.has(carNum) ? result.get(carNum) : 0;
        result.set(carNum, curTime + (ENDTIME - parkingTime));
    }
    parking.clear();

    const resultToArr = [...result]
    return resultToArr.sort((a, b) => a[0] - b[0]).map(([_, time]) => {
        let fee = basicFee;
        
        console.log(time, basicTime);
        if (time > basicTime) {
            fee += Math.ceil(((time - basicTime) / unitTime)) * unitFee;
        }
        return fee;
    });
}

console.log(solution([120, 0, 60, 591],	["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]));

// 주차 요금 계산 (Lv2)