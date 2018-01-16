import { Component, ILogger, IConfigReader } from "merapi";


export default class Controller {

    constructor(
        private logger: ILogger,
        private config: IConfigReader) {
    }

    public async start() {
        
    }

    public hello(req: any, res: any): void {
        res.json({hello: "world"});
    }
}
