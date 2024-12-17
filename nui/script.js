// This receives data from the client, and updates it in the UI.
function display(state) {
  const locationElement = document.getElementById('location');
  if (state) {
    locationElement.style.display = 'block';
  } else {
    locationElement.style.display = 'none';
  }
}
// This event listener gets the location and heading of the player, and updates the UI.
window.addEventListener('message', (event) => {
  const data = event.data;

  if (data.type === 'position') {
    document.getElementById('heading-output').textContent = Math.round(data.heading);
    document.getElementById('pos-x-output').textContent = Math.round(data.x);
    document.getElementById('pos-y-output').textContent = Math.round(data.y);
    document.getElementById('pos-z-output').textContent = Math.round(data.z);
  }

  if (data.type === 'toggleCoordsUI') {
    console.log('UI', data.data)
    display(data.data);
  }
})