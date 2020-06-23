

protocol SmsSender {
    
    func send(to: Int64, text: String) -> Result<String, Error>
    
    func send(to: Int64, template: String, args: String...) -> Result<String, Error>
}
