//
//  http-client.swift
//  pokedex
//
//  Created by Ktchoumh on 3/22/23.
//

import Foundation;

enum RequestError: Error {
	case invalidUrl(String);
	case invalidRequest(String);
}

public enum RequestType: String {

	case POST;
	case GET;
	case PUT;
	case DELETE;
	case HEAD;
	case PATCH;
	case TRACE;
	case CONNECT;
	
	func getDefault() -> String {
		
		return self.rawValue;
	}
}

struct RequestOptions {
	
	var path: String;
	var method: RequestType = RequestType.GET;
	var params: Optional<[URLQueryItem]>;
}

class HttpClient {
	
	private let baseURl: URL
	
	public init(baseUrl: String) {
		self.baseURl = URL(string: baseUrl)!;
	}
	
	private func configureMethod(
		url: URL,
		method: RequestType,
		params: [URLQueryItem]
	) throws -> URLRequest {
		
		var req: URLRequest = URLRequest(url: url);
		req.httpMethod = method.getDefault();
		
		req.addValue("application/json", forHTTPHeaderField: "Content-Type");
		req.addValue("application/json", forHTTPHeaderField: "Accept");
		req.addValue("pokedex-sdk/v1", forHTTPHeaderField: "User-Agent");
		req.url?.append(queryItems: params);

		return req;
	}
	
	private func req<T: Codable>(requestOptions: RequestOptions?) async throws -> T {
		
		let urlSession = URLSession.shared;
		guard let url = URL(
			string: (requestOptions?.path ?? ""),
			relativeTo: self.baseURl
		) else {
			throw RequestError.invalidUrl("invalid url");
		}
		
		let req = try self.configureMethod(
			url: url,
			method: requestOptions!.method,
			params: requestOptions?.params ?? []
		);
		
		let (data, res) = try await urlSession.data(for: req);
		guard (res as? HTTPURLResponse)?.statusCode == 200 else {
			
			throw RequestError.invalidRequest(
				String(decoding: data, as: UTF8.self)
			);
		}
		let response = try JSONDecoder().decode(T.self, from: data);
		return response;
	}
	
	public func get<T: Codable>(
		route: String,
		params: Optional<[URLQueryItem]>
	) async throws -> T {
		
		let ret: T = try await self.req(
			requestOptions: RequestOptions(
				path: route,
				params: params
			)
		);
		
		return ret;
	}
}
