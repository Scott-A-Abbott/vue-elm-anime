import anime from "animejs";

export function animate(eID) {
  anime({
    targets: eID,
    opacity: "1",
    duration: "2000",
    easing: 'easeInOutCirc',
    rotate: '10turn'
  });
}