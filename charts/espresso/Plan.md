# Plan

- [ ] Service Monitor for Prometheus
- [X] Secret store
- [X] Deployment for Sequencer Node and DA Node
- [X] Service for Sequencer Node and DA Node
- [X] Ingress for Sequencer Node and DA Node. This is GCP, so we will use GCP Ingress
- [ ] Prometheus rules???
- [ ] Automate keys creation and deployment to Secrets Manager
- [ ] Create CloudSQL instances

## Notes

- Unlike previous testnets, all sequencer nodes (DA or non-DA) will need to allow public inbound traffic.  This is to facilitate the gossip network between nodes.  Our gossip network uses the standard libp2p implementation that many other projects use.  The configuration supports setting both a "bind" address and "advertise" address, so it is possible to put this behind a load balancer. 
- DA nodes will also need to allow public inbound traffic, but this can also be put behind a load balancer