function solution(id_list, report, k) {
    var reporterMap = new Map();
    var receivedCount = new Map();

    for (const id of id_list) {
        reporterMap.set(String(id), new Set());
        receivedCount.set(String(id), 0);
    }

    for (var r of report) {
        r = r.split(" ");
        reporterMap.get(r[1]).add(r[0]);
    }

    for (const entry of reporterMap.entries()) {
        if (entry[1].size < k) continue;
        for (const reporter of entry[1]) {
            receivedCount.set(reporter, receivedCount.get(reporter) + 1);
        }
    }

    return Array.from(receivedCount.values());
}

console.log(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2));

// 신고 결과 받기 (Lv1)