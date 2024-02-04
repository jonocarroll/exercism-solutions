//
// This is only a SKELETON file for the 'Gigasecond' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const gigasecond = (d) => {
    return(new Date(d.getTime() + (1000*1000*1000*1000)));
};
