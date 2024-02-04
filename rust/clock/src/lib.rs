use std::fmt;

#[derive(Debug, Eq, PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let mut tmphours = hours;
        let mut tmpmins = minutes;

        while tmpmins < 0 {
            tmpmins += 60;
            tmphours -= 1
        }
        while tmpmins > 59 {
            tmpmins -= 60;
            tmphours += 1
        }
        while tmphours < 0 {
            tmphours += 24
        }
        while tmphours > 23 {
            tmphours -= 24
        }

        let totmins = (tmphours * 60) + (tmpmins % 60);
        let newmins = totmins % 60;
        let newhours = (totmins / 60) % 24;

        Clock {
            hours: newhours,
            minutes: newmins,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let newmins = self.minutes + minutes;
        Clock::new((self.hours + (newmins / 60)) % 24, newmins % 60)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str(&format!("{0:02}:{1:02}", self.hours, self.minutes))
    }
}
