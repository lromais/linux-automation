const AWS = require('aws-sdk');

exports.handler = (event, _context, callback) => {
    const ec2 = new AWS.EC2({ region: event.instanceRegion });
    
    ec2.stopInstances({ InstanceIds: [event.instanceId] }).promise()
        .then(() => callback(null, `Sucessfully stopped ${event.instanceId}`))
        .catch(err => callback(err));
    };