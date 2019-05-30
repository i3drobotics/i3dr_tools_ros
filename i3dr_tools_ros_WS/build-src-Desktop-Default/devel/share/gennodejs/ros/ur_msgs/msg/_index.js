
"use strict";

let Digital = require('./Digital.js');
let MasterboardDataMsg = require('./MasterboardDataMsg.js');
let Analog = require('./Analog.js');
let RobotModeDataMsg = require('./RobotModeDataMsg.js');
let RobotStateRTMsg = require('./RobotStateRTMsg.js');
let IOStates = require('./IOStates.js');
let ToolDataMsg = require('./ToolDataMsg.js');

module.exports = {
  Digital: Digital,
  MasterboardDataMsg: MasterboardDataMsg,
  Analog: Analog,
  RobotModeDataMsg: RobotModeDataMsg,
  RobotStateRTMsg: RobotStateRTMsg,
  IOStates: IOStates,
  ToolDataMsg: ToolDataMsg,
};
