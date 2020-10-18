const AWS = require('aws-sdk');

exports.handler = (event, _context, callback) => {
    const ec2 = new AWS.EC2({ region: event.instanceRegion });
    
    ec2.startInstances({ InstanceIds: [event.instanceId] }).promise()
        .then(() => callback(null, `Sucessfully started ${event.instanceId}`))
        .catch(err => callback(err));
    };