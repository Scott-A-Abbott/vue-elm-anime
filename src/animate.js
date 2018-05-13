import anime from "animejs";

export function animate(eID) {
  anime({
    targets: eID,
    opacity: "0",
    direction: 'alternate',
    loop: true,
    easing: 'linear'
  });
}