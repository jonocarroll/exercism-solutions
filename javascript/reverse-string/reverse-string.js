export const reverseString = (s) => {
    var res = "";
    if (s.length == 0) {
        return res
    };
    for (let i = s.length - 1; i >= 0; i--) {
        res += s[i]
    };
    return res
};
